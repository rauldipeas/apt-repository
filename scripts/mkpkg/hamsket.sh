#!/bin/bash
set -e
# Hasmsket
aria2c --console-log-level=error --summary-interval=0 $(curl -su $GH_API_AUTH https://api.github.com/repos/TheGoddessInari/Hamsket/releases|grep browser_download_url|grep amd64.deb|head -n1|cut -d '"' -f4)
dpkg-deb -x Hamsket*.deb hamsket
dpkg-deb -e Hamsket*.deb hamsket/DEBIAN
rm -rf Hamsket*.deb
npx asar e hamsket/opt/Hamsket/resources/app.asar app-hamsket
cat <<EOF |tee -a  app-hamsket/resources/Hamsket-all.css
@media (prefers-color-scheme:dark) {
	html..x-viewport, html.x-viewport>body.x-body { background: #222 !important; }
	.x-tab-bar, .x-window-header-default-top { background-color: #222 !important }
	.x-tab { background-color: #40474d !important }
	.x-toolbar { background-color: #222 !important }
	.x-tab-bar-strip { background-color: #333 !important }
	.service { border-bottom: 1px solid #333 !important; }
	.service:hover { background: #292929; }
	.x-panel-header-default { color: #f5f5f5 !important; background-color: #222 !important; border-bottom: 1px solid #333 !important; }
	.x-toolbar.x-docked.x-toolbar-default.x-docked-bottom.x-toolbar-docked-bottom.x-toolbar-default-docked-bottom.x-box-layout-ct.x-noborder-rbl { background-color: #292929 !important }
	.x-panel-body-default { color: #f5f5f5 !important; background-color: #222 !important }
	.x-panel-header-title-default { color: #f5f5f5 !important }
	.x-grid-with-row-lines .x-grid-item, .x-grid-group-hd { border: 1px solid #333 !important; }
	.x-grid-item { color: #f5f5f5 !important; background-color: #222 !important }
	.x-grid-group-hd { background-color: #222 !important }
	.x-tab-inner-default { color: #eee; font-weight: 700; }
	.x-tab-bar-default { background-color: #393939 }
	.x-tab-default-bottom { background-color: #2d2c2c }
	.x-tab.x-tab-active.x-tab-default { background-color: #333 !important }
	.x-tab.x-tab-active.x-tab-default .x-tab-inner-default, .x-window-header-title-default, .x-form-item-label-inner, .x-fieldset-header-default>.x-fieldset-header-text, .x-grid-group-title { color: #fff !important }
	.x-tab-inner-default { color: #999 }
	.x-tab-over.x-tab-default { border-color: #201F1F; background-color: #201F1F }
	.x-box-inner { background: #292929; }
	.x-panel-body-default { background: #222; color: #fff; }
	.x-btn-default-toolbar-small { background-color: #555; color: #eee; border-radius: 0; padding-right: 3px; border-color: #222; }
	.x-btn-over.x-btn-default-toolbar-small { background: #666; }
	.x-btn-inner-default-toolbar-small, .x-btn-icon-el-default-toolbar-small.x-btn-glyph { color: #fff !important; }
	.x-btn.x-btn-menu-active.x-btn-default-toolbar-small, .x-btn.x-btn-pressed.x-btn-default-toolbar-small { background: cornflowerblue; border-color: #222; }
	.x-form-text-default { background: #888; }
	.x-form-trigger-wrap-default { border: 1px solid #333; }
	.x-form-trigger-default { background: transparent; }
}
/**
 * Dark background
 */
.x-tab {
  background-color: #000000
}
.x-tab:hover {
  background-color: #090909
}
.x-tab-bar-body {
  background-color: #000000
}
.x-tab.x-tab-active.x-tab-default {
  border-color: white;
  background-color: #090909
}
EOF
npx asar p app-hamsket app.asar
mv app.asar hamsket/opt/Hamsket/resources/app.asar
dpkg-deb -b hamsket .
mv hamsket*.deb assets/packages
rm -rf *hamsket*
