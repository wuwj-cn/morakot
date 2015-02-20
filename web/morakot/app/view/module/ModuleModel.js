/**
 * 模块的数据模型
 */

Ext.define('app.view.module.ModuleModel', {
    extend: 'Ext.app.ViewModel',
    alias: 'viewmodel.module',

    // 在开发过程中我先用设定好的值放于data中，等以后自定义的时候，data里的值都是从后台取得的
    // 所有数据库里的字段，我都以tf_开头，只是为了表示这是从后台读取过来的

    data: {

        tf_moduleId: '1010', // 模块ID号：一个数字的ID号，可以根据此ID号的顺序将相同分组的模块放在一块。
        tf_ModuleGroup: '工程管理',// 模块分组：模块分到哪个组里，比如说业务模块1、业务模块2、系统设置、系统管理等。
        tf_moduleName: 'Global', // 模块标识：系统中唯一的模块的标识
        tf_title: '工程项目',// 模块名称：能够描述此模块信息的名称。
        tf_glyph: 0xf0f7, // 图标字符值
        tf_shortname: null,// 模块简称：如果名称过长，有些地方可以用简称来代替。
        tf_englishName: null,// 模块英文名称：万一要制作英文版，可以用英文名称。
        tf_englishShortName: null, // 模块英文简称：可以用作生成编码字段。
        tf_description: null,// 模块描述：
        tf_remark: null
        // 备注：

        // 下面还有若干字段未加入，以后用到的时候再加入
    }

})