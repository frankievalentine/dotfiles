module.exports = {
  config: {
    updateChannel: 'canary',
    fontSize: 16,
    fontFamily: '"Operator Mono", "Roboto Mono", "Fira Code", monospace',
    cursorColor: 'rgba(248,28,229,0.8)',
    cursorShape: 'BLOCK',
    cursorBlink: true,
    foregroundColor: '#fff',
    backgroundColor: '#000',
    borderColor: '#333',
    css: '',
    termCSS: '',
    showHamburgerMenu: '',
    showWindowControls: '',
    padding: '10px',
    colors: {
      black: '#000000',
      red: '#ff0000',
      green: '#33ff00',
      yellow: '#ffff00',
      blue: '#0066ff',
      magenta: '#cc00ff',
      cyan: '#00ffff',
      white: '#d0d0d0',
      lightBlack: '#808080',
      lightRed: '#ff0000',
      lightGreen: '#33ff00',
      lightYellow: '#ffff00',
      lightBlue: '#0066ff',
      lightMagenta: '#cc00ff',
      lightCyan: '#00ffff',
      lightWhite: '#ffffff'
    },
    
    hyperTabs: {
        trafficButtons: true,
        border: true,
        tabIconsColored: true,
        activityColor: 'salmon',
        closeAlign: 'right',
    },
    
    hyperStatusLine: {
        dirtyColor: 'salmon',
        aheadColor: 'ivory',
        footerTransparent: false,
    },
    
    shell: '',
    shellArgs: ['--login'],
    env: {},
    bell: false,
    copyOnSelect: false,
  },

  plugins: [
    'hyper-statusline', 
    'hyper-tabs-enhanced',
    'hyper-chesterish',
  ],
  }
};
