$ = require 'jquery'
_ = require 'underscore'
backbone = require 'backbone'
marionette = require 'backbone.marionette'


class ProductModalView extends marionette.ItemView
  className: 'modal-dialog'
  template: require './templates/product_modal'
  serializeData: =>
    res = super
    lang = $('html').attr 'lang'
    currency = ''
    if lang is 'ru'
      currency = 'руб'
    if lang is 'en'
      currency = 'rub'
    res.currency = currency
    return res


class ProductItemView extends marionette.ItemView
  events:
    'click': 'onClick'
  onClick: =>
    id = @$el.data 'id'
    @trigger 'modal',
      name: @$el.data 'name'
      desc: @$el.data 'desc'
      price: @$el.data 'price'
      thumb: @$el.data 'thumb'


class MenuView extends marionette.LayoutView
  el: 'body'
  regions:
    region_modal: '.region_modal'

  initialize: =>
    $('.layout_table .product_list .product_item').each (index, el) =>
      view = new ProductItemView({el: el})
      @listenTo view, 'modal', (data) =>
        product = new backbone.Model(data)
        view = new ProductModalView(model: product)
        @region_modal.show(view)
        $('.region_modal').modal()


module.exports = ->
  new MenuView