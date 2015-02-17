/**
 * 系统主页顶部区域
 */
Ext.define('app.view.main.region.Top', {
	extend: 'Ext.toolbar.Toolbar',
	alias: 'widget.maintop',
	
	uses: [
	       'app.ux.ButtonTransparent',
	       'app.view.main.menu.ButtonMainMenu',
	       'app.view.main.menu.SettingMenu'
	],
	
	defaults : {
	    xtype : 'buttontransparent'
	},
	height : 40,
	items: [{
		xtype: 'image',
		bind: {
			hidden: '{!system.iconUrl}',
			src: '{system.iconUrl}'
		}
	}, {
		xtype: 'label',
		bind: {
			text: '{system.name}'
		},
		style: 'font-size : 20px; color : blue;'
	}, {
		xtype: 'label',
		bind: {
			text: '{system.version}'
		}
	}, '->', {
		xtype : 'buttonmainmenu',
		hidden : true,
		bind : {
			hidden : '{!isButtonMenu}'
		}
	}, ' ', ' ', {
		text: '主页',
		glyph: 0xf015
	}, {
		text: '帮助',
		glyph: 0xf059
	}, {
		text: '关于',
		glyph: 0xf06a
	}, {
		xtype : 'settingmenu'
	}, '->', '->', {
		text: '搜索',
		glyph: 0xf002
	}, {
		text: '注销',
		glyph: 0xf011
	}, {
		glyph : 0xf102,
	    handler : 'hiddenTopBottom',
	    tooltip : '隐藏顶部和底部区域'
	}]
});