import ReactDOM from 'react-dom/client';
import { isEnvBrowser } from './utils';
// Styles
import './styles/index.scss';
// Components
import App from './App.tsx';

if (isEnvBrowser) document.body.style.backgroundColor = '#1A1A1A';

ReactDOM.createRoot(document.body!).render(<App />);
