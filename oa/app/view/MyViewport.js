/*
 * File: app/view/MyViewport.js
 *
 * This file was generated by Sencha Architect version 3.2.0.
 * http://www.sencha.com/products/architect/
 *
 * This file requires use of the Ext JS 5.1.x library, under independent license.
 * License of Sencha Architect does not include license for Ext JS 5.1.x. For more
 * details see http://www.sencha.com/license or contact license@sencha.com.
 *
 * This file will be auto-generated each and everytime you save your project.
 *
 * Do NOT hand edit this file.
 */

Ext.define('oa.view.MyViewport', {
    extend: 'Ext.container.Viewport',
    alias: 'widget.myviewport',

    requires: [
        'oa.view.MyViewportViewModel',
        'Ext.tree.Panel',
        'Ext.tree.View',
        'Ext.grid.Panel',
        'Ext.grid.column.Column',
        'Ext.XTemplate',
        'Ext.chart.CartesianChart',
        'Ext.chart.axis.Category3D',
        'Ext.chart.axis.Numeric3D',
        'Ext.chart.series.Bar3D'
    ],

    viewModel: {
        type: 'myviewport'
    },
    itemId: 'headerPanel',
    layout: 'border',
    defaultListenerScope: true,

    items: [
        {
            xtype: 'panel',
            region: 'north',
            height: '10%',
            itemId: 'headerPanel'
        },
        {
            xtype: 'treepanel',
            collapseMode: 'mini',
            region: 'west',
            split: true,
            itemId: 'menuPanel',
            width: '20%',
            collapsed: false,
            collapsible: true,
            title: 'Panel',
            store: 'MenuStore',
            viewConfig: {
                itemId: 'treeMenu'
            }
        },
        {
            xtype: 'panel',
            region: 'center',
            itemId: 'contentPanel',
            layout: 'border',
            title: 'Content',
            items: [
                {
                    xtype: 'gridpanel',
                    flex: 1,
                    region: 'north',
                    frame: true,
                    itemId: 'gridPanel',
                    store: 'gridDataStore',
                    columns: [
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'manufacturer',
                            text: 'Manufacturer'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'model',
                            text: 'Model'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'price',
                            text: 'Price'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'wiki',
                            text: 'Wiki'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'img',
                            text: 'Img'
                        },
                        {
                            xtype: 'gridcolumn',
                            dataIndex: 'quality',
                            text: 'Quality'
                        }
                    ],
                    listeners: {
                        select: 'onGridpanelSelect'
                    }
                },
                {
                    xtype: 'panel',
                    flex: 1,
                    region: 'center',
                    itemId: 'detailPanel',
                    tpl: [
                        '<img src="data/{img}" style="float: right" />',
                        'Manufacturer: {manufacturer}</br>',
                        'Model: <a href="{wiki}" target="_blank">{model}</a><br/> Price: {price:usMoney}'
                    ],
                    title: 'Detail'
                },
                {
                    xtype: 'panel',
                    flex: 1,
                    region: 'south',
                    layout: 'fit',
                    title: 'chart',
                    items: [
                        {
                            xtype: 'cartesian',
                            height: 250,
                            itemId: 'qualityChart',
                            width: 400,
                            insetPadding: 20,
                            store: 'CarChartStore',
                            axes: [
                                {
                                    type: 'category3d',
                                    fields: [
                                        'name'
                                    ],
                                    position: 'bottom',
                                    title: '项目'
                                },
                                {
                                    type: 'numeric3d',
                                    fields: [
                                        'rating'
                                    ],
                                    majorTickSteps: 4,
                                    maximum: 5,
                                    minimum: 0,
                                    position: 'left',
                                    title: '得分'
                                }
                            ],
                            series: [
                                {
                                    type: 'bar3d',
                                    label: {
                                        display: 'insideEnd',
                                        field: 'rating',
                                        color: '#333',
                                        'text-anchor': 'middle'
                                    },
                                    xField: 'name',
                                    yField: [
                                        'rating'
                                    ]
                                }
                            ]
                        }
                    ]
                }
            ]
        }
    ],

    onGridpanelSelect: function(rowmodel, record, index, eOpts) {
                // grab a reference to the detailPanel via itemId
                // the # in front of the id indicates that we would like to grab a reference by
                var detailPanel = this.child('#contentPanel').child('#detailPanel');
                // update the detailPanel with data
                // this will trigger the tpl to become updates
                detailPanel.update(record.data);

                // grab a reference to the qualityChart, notice we use down here instead of child
                // because down will go down the container hierarchy at any depth and child
                // only retrieves direct children
                var chart = this.child('#contentPanel').down('#qualityChart');
                // get the quality field out of this record
                var qualityData = record.get('quality');
                chart.store.loadData(qualityData);
    }

});