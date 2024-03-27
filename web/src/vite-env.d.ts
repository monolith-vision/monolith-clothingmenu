/// <reference types="vite/client" />

interface NuiMessageData<T = unknown> {
	action: string;
	data: T;
}

type NuiHandlerSignature<T> = (data: T) => void;
