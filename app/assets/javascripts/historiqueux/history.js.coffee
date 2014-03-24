$ () ->

  $(document).delegate '.event_open_relation', 'click', (e) ->
    console.log('event_open_relation')
    event.stopPropagation()
    event.preventDefault()
    parent = $(@).data('parent')
    resource = $(@).data('resource')
    id = $(@).data('id')
    relation = $(@).data('relation')
    console.log('parent_div = ' + parent)
    console.log('resource = ' + resource)
    console.log('resource_id = ' + id)
    console.log('relation = ' + relation)
    $.ajax
      url: '/historiqueux/' + resource + '/' + id + '/relations/' + relation
      type: "get"
      dataType: "html"
      data:
        "parent_div": parent
      success: (returnData) ->
        console.log('success')
        console.log("#" + parent)
        console.log(returnData)
        if parent
          $("#" + parent).html(returnData)
        else
          console.log('no parent')
          $('body').html(returnData)
        @
      error: (e) ->
        alert(e)
        @
    @

    $(document).delegate '#event_back', 'click', (e) ->
      console.log('event_back click')
      event.stopPropagation()
      event.preventDefault()
      parent = $(@).data('parent')
      resource = $(@).data('resource')
      id = $(@).data('id')
      console.log('parent_div = ' + parent)
      console.log('resource = ' + resource)
      console.log('resource_id = ' + id)
      $.ajax
        url: "/historiqueux/" + resource + "/" + id + "?parent_div=" + parent
        type: "get"
        dataType: "html"
        data:
          "parent_div": parent
        success: (returnData) ->
          console.log('success')
          console.log("#" + parent)
          console.log(returnData)
          if parent
            $("#" + parent).html(returnData)
          else
            console.log('no parent')
            $('body').html(returnData)
          @
        error: (e) ->
          alert(e)
          @
      @

  $(document).delegate '.open_event_details', 'click', (e) ->
    console.log('open_event_details click')
    event.stopPropagation()
    event.preventDefault()
    event_id = $(@).data('event-id')
    console.log('event-id = ' + event_id)
    parent = $(@).data('parent-div')
    resource = $(@).data('resource')
    id = $(@).data('resource-id')
    console.log('parent_div = ' + parent)
    console.log('resource = ' + resource)
    console.log('resource_id = ' + id)
    console.log('url = ' + "/historiqueux/" + resource + "/" + id + "/" + event_id)
    $.ajax
      url: "/historiqueux/" + resource + "/" + id + "/" + event_id
      type: "get"
      dataType: "html"
      data:
        "parent_div": parent
      success: (returnData) ->
        console.log('success')
        console.log("#" + parent)
        console.log(returnData)
        if parent
          $("#" + parent).html(returnData)
        else
          console.log('no parent')
          $('body').html(returnData)
        @
      error: (e) ->
        alert(e)
        @
    @


