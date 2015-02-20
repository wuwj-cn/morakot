/**
 * This class is the main view for the application. It is specified in app.js as the
 * "autoCreateViewport" property. That setting automatically applies the "viewport"
 * plugin to promote that instance of this class to the body element.
 *
 * TODO - Replace this content of this view to suite the needs of your application.
 */
Ext.define('app.view.main.Main', {
    extend: 'Ext.container.Container',
    xtype: 'app-main',
    
    uses: [
           'app.view.main.region.Center',
           'app.view.main.region.Top',
           'app.view.main.region.Bottom',
           'app.view.main.region.Left',
           'app.view.main.menu.MainMenuToolbar'
    ],
    
    controller: 'main',
    viewModel: {
        type: 'main'
    },

    layout: {
        type: 'border'
    },
    
    initComponent : function() {
        Ext.setGlyphFontFamily('FontAwesome'); // 设置图标字体文件，只有设置了以后才能用glyph属性
        this.callParent();
    },

    items: [{
    	xtype: 'maintop',
    	region: 'north'
    }, {
    	xtype: 'mainmenutoolbar',
        region: 'north', // 把他放在maintop的下面
        hidden : true,
		bind : {
			hidden : '{!isToolbarMenu}'
		}
    },{
    	region: 'center',
    	xtype : 'maincenter'
    }, {  
        xtype : 'mainmenuregion',  
        region : 'west', // 左边面板  
        width : 220,
        split : true,
        title: '导航菜单',
        collapsible: true,
        hidden : true,
		bind : {
			hidden : '{!isTreeMenu}'
		}
    }, {
    	xtype: 'mainbottom',
        region: 'south' // 把他放在最底下
    }]
});
