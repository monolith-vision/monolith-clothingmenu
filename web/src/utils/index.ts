export * from './hooks';

export const isEnvBrowser = !('GetParentResourceName' in window);

const resourceName = (window as any).GetParentResourceName
	? (window as any).GetParentResourceName()
	: 'nui-resource';

export async function fetchNui<T = any>(
	event: string,
	data?: any,
	mockData?: T,
): Promise<void | T> {
	if (isEnvBrowser) {
		if (mockData) return mockData;
		return;
	}

	const resp = await fetch(`https://${resourceName}/${event}`, {
		method: 'POST',
		body: JSON.stringify(data),
	});

	return await resp.json();
}
