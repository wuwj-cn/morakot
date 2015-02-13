/**
 * 系统主页的底部区域
 */
Ext.define('app.view.main.region.Bottom', {
    extend: 'Ext.toolbar.Toolbar',
    alias: 'widget.mainbottom',
    items: [{
        bind: {
            text: '单位:{user.company}'
        },
        glyph: 0xf0f7
    }, {
        bind: {
            text: '用户:{user.name}'
        },
        glyph: 0xf0f7
    }, '->', {
        bind: {
            text: 'qq:{service.qq}'
        }
    }, {
        bind: {
            hidden: '{!service.email}', // 绑定值前面加！表示取反，如果有email则不隐藏，如果email未设置，则隐藏
            text: 'eMail:{service.email}'
        },
        glyph: 0xf003
    }, {
        bind: {
            text: '©{service.copyright}'
        }
    }]
});