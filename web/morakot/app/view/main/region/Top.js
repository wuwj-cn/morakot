/**
 * 系统主页顶部区域
 */
Ext.define('app.view.main.region.Top', {
	extend: 'Ext.toolbar.Toolbar',
	alias: 'widget.maintop',
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
		text: '菜单',
		glyph: 0xf0c9,
		menu: [{
			text: '工程管理',
			menu: [{
				text: '工程项目'
			}, {
				text: '工程标段'
			}]
		}]
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
		text: '注销',
		glyph: 0xf011
	}, '->', '->', {
		text: '搜索',
		glyph: 0xf002
	}, {
		text: '设置',
		glyph: 0xf013
	}]
});