// hyper.js configuration by @mcking-07

'use strict';

const getGeneralConfig = () => {
  const generalConfig = {
    updateChannel: 'stable',
    fontSize: 12,
    fontFamily: 'Monaco, Hack Nerd Font, Menlo, monospace',
    fontWeight: 'normal',
    fontWeightBold: 'bold',
    lineHeight: 1,
    letterSpacing: 0,
    cursorColor: 'rgba(248,28,229,0.8)',
    cursorAccentColor: '#000',
    cursorShape: 'BEAM',
    cursorBlink: true,
    foregroundColor: '#fff',
    backgroundColor: '#000',
    selectionColor: 'rgba(248,28,229,0.3)',
    borderColor: '#333',
    css: '',
    termCSS: '',
    workingDirectory: '',
    showHamburgerMenu: '',
    showWindowControls: '',
    padding: '12px 14px',
    colors: {
      black: '#000000',
      red: '#C51E14',
      green: '#1DC121',
      yellow: '#C7C329',
      blue: '#0A2FC4',
      magenta: '#C839C5',
      cyan: '#20C5C6',
      white: '#C7C7C7',
      lightBlack: '#686868',
      lightRed: '#FD6F6B',
      lightGreen: '#67F86F',
      lightYellow: '#FFFA72',
      lightBlue: '#6A76FB',
      lightMagenta: '#FD7CFC',
      lightCyan: '#68FDFE',
      lightWhite: '#FFFFFF',
      limeGreen: '#32CD32',
      lightCoral: '#F08080',
    },
  };

  return generalConfig;
};

const getShellConfig = () => {
  const shellConfig = {
    shell: '',
    shellArgs: ['--login'],
    env: {},
  };

  return shellConfig;
};

const getSoundConfig = () => {
  const soundConfig = {
    bell: 'SOUND',
    // bellSoundURL: '/path/to/sound/file',
  };

  return soundConfig;
};

const getPluginConfig = () => {
  const hyperTabs = {
    trafficButtons: true,
    tabIconsColored: true,
    border: true,
    activityColor: 'salmon',
    activityPulse: true,
  };

  const hyperStatusLine = {
    dirtyColor: 'salmon',
    aheadColor: 'ivory',
    footerTransparent: true,
  };

  const paneNavigation = {
    debug: false,
    hotkeys: {
      navigation: {
        up: 'alt+shift+up',
        down: 'alt+shift+down',
        left: 'alt+shift+left',
        right: 'alt+shift+right',
      },
      jump_prefix: 'alt+shift',
      permutation_modifier: 'shift',
      maximize: 'ctrl+alt+enter',
    },
    showIndicators: false,
    indicatorPrefix: '~',
    indicatorStyle: {
      position: 'absolute',
      top: 0,
      left: 0,
      fontSize: '10px',
    },
    focusOnMouseHover: true,
    inactivePaneOpacity: 1,
  };

  const broadcast = {
    debug: false,
    hotkeys: {
      selectCurrentPane: 'ctrl+shift+p',
      selectCurrentTabPanes: 'ctrl+shift+b',
      selectAllPanes: 'ctrl+alt+b',
    },
    indicatorStyle: {
      position: 'absolute',
      top: 5,
      right: 10,
      borderRadius: '50%',
      width: '10px',
      height: '10px',
      backgroundColor: '#88C0D0',
      boxShadow: '0 0 0 2px #D8DEE9',
    },
  };

  const pluginConfig = {
    hyperTabs, hyperStatusLine, paneNavigation, broadcast,
  };

  return pluginConfig;
};

const getMiscellaneousConfig = () => {
  const miscellaneousConfig = {
    copyOnSelect: true,
    defaultSSHApp: true,
    quickEdit: false,
    macOptionSelectionMode: 'vertical',
    webGLRenderer: true,
    webLinksActivationKey: '',
    disableLigatures: true,
    disableAutoUpdates: true,
    screenReaderMode: false,
    preserveCWD: true,
  };

  return miscellaneousConfig;
};

const getConfig = () => {
  const generalConfig = getGeneralConfig();
  const shellConfig = getShellConfig();
  const soundConfig = getSoundConfig();
  const pluginConfig = getPluginConfig();
  const miscellaneousConfig = getMiscellaneousConfig();

  const config = {
    ...generalConfig, ...shellConfig, ...soundConfig, ...pluginConfig, ...miscellaneousConfig,
  };

  return config;
};

const getPlugins = () => {
  const plugins = [];

  plugins.push('nord-hyper');
  plugins.push('hyper-pane');
  plugins.push('hyperpower');
  plugins.push('hyperinator');
  plugins.push('hyper-search');
  plugins.push('hyper-broadcast');
  plugins.push('hyper-statusline');
  plugins.push('hyper-tabs-enhanced');
  plugins.push('hyper-font-ligatures');
  plugins.push('hyper-highlight-active-pane');

  return plugins;
};

const getLocalPlugins = () => {
  const localPlugins = [];
  return localPlugins;
};

const getKeymaps = () => {
  const keymaps = {};
  return keymaps;
};

const config = getConfig();
const plugins = getPlugins();
const localPlugins = getLocalPlugins();
const keymaps = getKeymaps();

const hyperConfig = {
  config, plugins, localPlugins, keymaps,
};

module.exports = hyperConfig;
