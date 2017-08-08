class @PurchaseButton extends React.Component
  constructor: (props) ->
    @state =
      sendingRequest: false

  handleError: =>
    console.log @
    @setSendingRequest(false, () =>
      console.log @
      this.props.notifyOfError("something wen't wrong")
    )

  handleSuccess: (data)=>
    @setSendingRequest(false, () =>
      this.props.setPurchase(data)
    )

  setSendingRequest: (flag, cb) =>
    @setState(
      sendingRequest: flag
    , cb)

  purchase: =>
    @setSendingRequest(true, () =>
      $.ajax
        url: '/purchases'
        method: 'POST'
        data: JSON.stringify({products: this.props.items})
        success: this.handleSuccess
        error: this.handleError
        dataType: 'json'
        contentType: 'application/json'
    )
      
  render: ->
    button_text = "Purchase!"
    if this.state.sendingRequest
      button_text = "processing..."
    `<button disabled={this.state.sendingRequest} onClick={this.purchase.bind(this)} className='button purchase_btn'>Purchase!</button>`
