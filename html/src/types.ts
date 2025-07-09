export interface Zone {
    name: string;
    description: string;
    type?: string;
    warning?: string;
    color?: string;
    icon?: string;
}

export interface ZoneCardData {
    time: string;
    weather: string;
    zones: Zone[];
    currentZone: string;
}

export interface NuiMessage {
    action: string;
    data: ZoneCardData;
} 