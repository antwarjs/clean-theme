React = require 'react'
MomentDisplay = React.createFactory require './MomentDisplay'
Paths = require 'antwar-core/PathsMixin'
Router = require 'react-router'
config = require 'config'

{ div, span, header, h1, a, img } = require 'react-coffee-elements'

module.exports = React.createClass

  displayName: 'Item'

  mixins: [ Router.State, Paths ]

  render: ->
    item = @getItem()
    author = item.author or config.author.name
    div className: 'post',
      if item.headerImage? then img className: 'header-image', src: item.headerImage
      h1 className: 'post__heading',
        item.title
      div className: 'post__content',
        if item.isDraft then span className: 'draft-text', ' Draft'
        div dangerouslySetInnerHTML: __html: item.content
      if item.date then MomentDisplay className: 'post__moment', datetime: item.date
      if author then div className: 'post__author', "Authored by #{author}"
      # if item.next or item.prev
      #   div className: 'prevnext',
      #     if item.prev
      #         div {className: 'prevnext__prev'},
      #           div {className: 'prevnext__bg', style: backgroundImage: "url(#{item.prev.headerImage})"}
      #           span className: 'prevnext__info', 'You might also like'
      #           a className: 'prevnext__link', href: "/#{item.prev.url}", item.prev.title
      #     if item.next
      #         div {className: 'prevnext__next'},
      #           div {className: 'prevnext__bg', style: backgroundImage: "url(#{item.next.headerImage})"}
      #           span className: 'prevnext__info', 'Next item'
      #           a className: 'prevnext__link', href: "/#{item.next.url}", item.next.title
