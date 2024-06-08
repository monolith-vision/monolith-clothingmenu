import './styles/app.scss';
import { useEffect, useState } from 'react';
import { fetchNui, useNuiEvent } from './utils';
import { Icon } from '@iconify/react';

type BoneNames =
	| 'hat'
	| 'glasses'
	| 'mask'
	| 'vest'
	| 'shirt'
	| 'torso'
	| 'pants'
	| 'shoes'
	| 'watch_l'
	| 'watch_r'
	| 'chain';

type Vector2 = {
	x: number;
	y: number;
};

const icons: Record<BoneNames, string> = {
	hat: 'mingcute:hat-fill',
	glasses: 'mdi:glasses',
	mask: 'entypo:mask',
	vest: 'mingcute:vest-fill',
	shirt: 'game-icons:tank-top',
	torso: 'ion:shirt',
	pants: 'ph:pants-fill',
	shoes: 'mingcute:shoe-fill',
	watch_l: 'mingcute:watch-fill',
	watch_r: 'game-icons:forearm',
	chain: 'mdi:necklace',
};

type Bones = Record<BoneNames, Vector2 & { on: boolean; scale: number; }>;

export default function App() {
	const [display, toggleDisplay] = useState(false);
	const [bones, setBones] = useState<Bones | null>(null);

	useNuiEvent<Bones>('SetBones', setBones);
	useNuiEvent<boolean>('ToggleDisplay', toggleDisplay);

	useEffect(() => {
		fetchNui('NuiFocus', { display });
	}, [display]);

	const width = window.innerWidth;
	const height = window.innerHeight;

	const handleClick = (name: BoneNames) =>
		fetchNui('ToggleClothing', { name });

	return (
		display &&
		bones && (
			<main id="app">
				{Object.entries(bones).map(([name, pos]) => (
					<button
						className={pos.on ? 'active' : ''}
						key={name}
						onClick={() => handleClick(name as BoneNames)}
						style={{
							position: 'absolute',
							left: `${width * pos.x}px`,
							top: `${height * pos.y}px`,
							transform: `scale(${pos.scale})`
						}}
					>
						<Icon icon={icons[name as BoneNames]} />
					</button>
				))}
			</main>
		)
	);
}
