import React, { useState, useEffect } from 'react';
import { ZoneCardData, NuiMessage, Zone } from './types';
import './styles.css';

const App: React.FC = () => {
    const [card, setCard] = useState<ZoneCardData | null>(null);
    const [isVisible, setIsVisible] = useState(false);
    const [progress, setProgress] = useState(100);

    useEffect(() => {
        const handleMessage = (event: MessageEvent) => {
            const message = event.data as NuiMessage;
            if (message.action === 'showZoneCard') {
                setCard(message.data);
                setIsVisible(true);
                setProgress(100);
                // Animate progress bar
                let start = Date.now();
                const duration = 5000; // ms
                const interval = setInterval(() => {
                    const elapsed = Date.now() - start;
                    setProgress(Math.max(0, 100 - (elapsed / duration) * 100));
                    if (elapsed >= duration) {
                        clearInterval(interval);
                    }
                }, 50);
                setTimeout(() => setIsVisible(false), duration);
            }
        };
        window.addEventListener('message', handleMessage);
        return () => window.removeEventListener('message', handleMessage);
    }, []);

    if (!card) return null;

    // Find the current zone object
    const currentZoneObj: Zone | undefined = card.zones.find(z => z.name === card.currentZone);
    if (!currentZoneObj) return null;

    // Category mapping for warning badge
    const defaultCategoryMap = {
        gang: { color: '#f43f5e', icon: 'report', warning: 'High Risk!' },
        police: { color: '#3b82f6', icon: 'local_police', warning: 'Police Zone' },
        ems: { color: '#3b82f6', icon: 'medical_services', warning: 'EMS Zone' },
        safe: { color: '#22c55e', icon: 'verified', warning: 'Safe Zone' },
        default: { color: '#22c55e', icon: 'info', warning: 'General Area' },
    };
    const cat = (currentZoneObj.type || 'default').toLowerCase();
    const catData = defaultCategoryMap[cat] || defaultCategoryMap['default'];
    const color = currentZoneObj.color || catData.color;
    const warningText = currentZoneObj.warning || catData.warning;
    const icon = currentZoneObj.icon || "location_on";

    // Dynamic weather icon
    function getWeatherIcon(weatherStr: string) {
        if (!weatherStr) return 'wb_cloudy';
        const w = weatherStr.toLowerCase();
        if (w.includes('extra sunny')) return 'wb_sunny';
        if (w.includes('clear')) return 'wb_sunny';
        if (w.includes('neutral')) return 'wb_sunny';
        if (w.includes('smog')) return 'cloud';
        if (w.includes('fog')) return 'foggy';
        if (w.includes('overcast')) return 'filter_drama';
        if (w.includes('cloud')) return 'wb_cloudy';
        if (w.includes('clearing')) return 'wb_cloudy';
        if (w.includes('rain')) return 'umbrella';
        if (w.includes('thunder')) return 'flash_on';
        if (w.includes('snow') || w.includes('blizzard') || w.includes('xmas')) return 'ac_unit';
        if (w.includes('halloween')) return 'emoji_objects';
        return 'wb_cloudy';
    }
    // Dynamic time icon
    function getTimeIcon(timeStr: string) {
        const hour = parseInt(timeStr.split(':')[0], 10);
        return (hour >= 6 && hour < 18) ? 'wb_sunny' : 'nights_stay';
    }

    return (
        <div className={`zone-pill-container ${isVisible ? 'visible' : ''}`}>
            <div
                className={`zone-pill${cat === 'gang' ? ' gang' : ''}`}
                style={{ position: 'relative', '--zone-accent': color } as React.CSSProperties}
            >
                {/* Warning badge */}
                <span className="zone-warning-badge" style={{
                    display: 'flex', alignItems: 'center', gap: 6,
                    background: color + '22',
                    color: color,
                    borderRadius: 16,
                    fontWeight: 600,
                    fontSize: 15,
                    padding: '4px 12px',
                    marginRight: 18,
                }}>
                    <span className="material-icons" style={{ fontSize: 18 }}>{catData.icon}</span>
                    {warningText}
                </span>
                <span
                    className="zone-accent-dot"
                    style={{
                        display: 'inline-block',
                        width: 12,
                        height: 12,
                        borderRadius: '50%',
                        marginRight: 10,
                        background: color,
                    }}
                ></span>
                <span className="material-icons" style={{ fontSize: 26, color: color, marginRight: 8 }}>{icon}</span>
                <span style={{ fontWeight: 700, fontSize: 20, marginRight: 18 }}>{currentZoneObj.name}</span>
                <span style={{ color: '#e5e7eb', fontSize: 15, marginRight: 24 }}>{currentZoneObj.description}</span>
                <span className="material-icons" style={{ fontSize: 20, color: color, marginRight: 4 }}>{getTimeIcon(card.time)}</span>
                <span style={{ color: '#a1a1aa', fontSize: 15, marginRight: 16 }}>{card.time}</span>
                <span className="material-icons" style={{ fontSize: 20, color: color, marginRight: 4 }}>{getWeatherIcon(card.weather)}</span>
                <span style={{ color: '#a1a1aa', fontSize: 15 }}>{card.weather && card.weather !== 'NULL' ? card.weather.charAt(0).toUpperCase() + card.weather.slice(1) : 'Unknown'}</span>
                {/* Progress bar */}
                <div className='zone-pill-progress' style={{ width: `${progress}%` }} />
            </div>
        </div>
    );
};

export default App; 