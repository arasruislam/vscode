"use strict";

module.exports = {
  config: {
    updateChannel: "stable",

    fontSize: 16,
    fontFamily:
      '"MesloLGS NF", "JetBrainsMono Nerd Font", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',
    fontWeight: "400",
    fontWeightBold: "600",
    cursorColor: "rgba(248,28,229,0.8)",
    cursorAccentColor: "#000",
    cursorShape: "BLOCK",
    cursorBlink: false,
    foregroundColor: "#CDD6F4",
    backgroundColor: "#1E1E2E",
    borderColor: "rgba(255,255,255,0.1)",
    selectionColor: "rgba(245,194,231,0.3)",
    padding: "12px 14px",
    

    // ===== Opacity & Vibrancy =====
    opacity: {
      focus: 0.98,   // more opaque (less transparent)
      blur: 0.93,    // also raise for consistency
    },
    vibrancy: "ultra-dark", // better glass effect for macOS

    // ===== Catppuccin Theme =====
    theme: "catppuccin-mocha", // latte | frappe | macchiato | mocha

    // ===== Border Glow (stronger version) =====
    // hyperBorder: {
    //   borderColors: [
    //     "#CBA6F7",
    //     "#F5C2E7",
    //     "#89B4FA",
    //     "#94E2D5",
    //     "#A6E3A1",
    //   ],
    //   blurredColors: [
    //     "#CBA6F7",
    //     "#89B4FA",
    //     "#94E2D5",
    //     "#F5C2E7",
    //   ],
    //   borderWidth: "4px",
    //   animate: true,
    //   duration: "8s", // slower, smooth loop
    // },

    // ===== Behavior =====
    bell: "SOUND",
    copyOnSelect: false,
    defaultSSHApp: true,
    quickEdit: false,
    webGLRenderer: true,
    disableLigatures: true,
    disableAutoUpdates: false,
    screenReaderMode: false,
    preserveCWD: true,
  },

  plugins: [
    "hyper-statusline",
    "hyper-tabs-enhanced",
    "hyperborder",
    "hypercwd",
    "hyper-opacity",
    "hyper-tab-icons",
    "hyper-search",
    "hyper-font-ligatures",
    "@catppuccin/hyper#1.0.8", // must be last
  ],

  localPlugins: [],
  keymaps: {},
};
