$ () ->
  $(document).delegate '.event_open_relation', 'click', (e) ->
    event.stopPropagation()
    event.preventDefault()
    parent = $(@).data('parent')
    resource = $(@).data('resource')
    id = $(@).data('id')
    relation = $(@).data('relation')
    $.ajax
      url: '/historiqueux/' + resource + '/' + id + '/relations/' + relation
      type: "get"
      dataType: "html"
      data:
        "parent_div": parent
      success: (returnData) ->
        if parent
          $("#" + parent).html(returnData)
        else
          $('body').html(returnData)
        @
      error: (e) ->
        alert(e)
        @
    @

  $(document).delegate '#event_back', 'click', (e) ->
    event.stopPropagation()
    event.preventDefault()
    parent = $(@).data('parent')
    resource = $(@).data('resource')
    id = $(@).data('id')
    $.ajax
      url: "/historiqueux/" + resource + "/" + id + "?parent_div=" + parent
      type: "get"
      dataType: "html"
      data:
        "parent_div": parent
      success: (returnData) ->
        if parent
          $("#" + parent).html(returnData)
        else
          $('body').html(returnData)
        @
      error: (e) ->
        alert(e)
        @
    @

  $(document).delegate '.event_open_details', 'click', (e) ->
    event.stopPropagation()
    event.preventDefault()
    event_id = $(@).data('event-id')
    parent = $(@).data('parent-div')
    resource = $(@).data('resource')
    id = $(@).data('resource-id')
    $.ajax
      url: "/historiqueux/" + resource + "/" + id + "/" + event_id
      type: "get"
      dataType: "html"
      data:
        "parent_div": parent
      success: (returnData) ->
        if parent
          $("#" + parent).html(returnData)
        else
          $('body').html(returnData)
        @
      error: (e) ->
        alert(e)
        @
    @


