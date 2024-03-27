import { MutableRefObject, useEffect, useRef } from 'react';

export const useNuiEvent = <T = any>(
	action: string,
	handler: (data: T) => void,
) => {
	const savedHandler: MutableRefObject<NuiHandlerSignature<T>> = useRef(
		() => {},
	);

	useEffect(() => {
		savedHandler.current = handler;
	}, [handler]);

	useEffect(() => {
		const eventListener = (event: MessageEvent) => {
			if (savedHandler.current) {
				if (event.data.action === action) {
					savedHandler.current(event.data.data as T);
				}
			}
		};

		window.addEventListener('message', eventListener);
		return () => window.removeEventListener('message', eventListener);
	}, [action]);
};
