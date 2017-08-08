class @Purchaser extends React.Component
  constructor: (props) ->
    @state =
      purchase: undefined
      quantities: {}
      message: ""
      sendingRequest: false
  
  handleQtyUpdate: (data) ->
    quantities = this.state.quantities
    quantities[data.id] = data
    @setState
      quantities: quantities

  renderProduct: (product) ->
    `<ProductSelector product={product} key={product.id} notify={this.handleQtyUpdate.bind(this)}/>`

  renderProductSelection: ->
    `<div className='products' >
      {this.props.products.map(this.renderProduct.bind(this))}
    </div>`

  renderSection: ->
  
  notifyOfError: (msg)=>
    @setState
      message: msg

  setPurchase: (purchase) =>
    @setState
      purchase: purchase


  render: ->
    if this.state.purchase?
      `<div className='purchase_section'>
        Thank you for your purchase
      </div>`
    else
      `<div className='purchase_section'>
        {this.renderProductSelection()}
        <div className='message'>{this.state.message}</div>
        <PurchaseButton setPurchase={this.setPurchase} notifyOfError={this.notifyOfError} items={Object.values(this.state.quantities)} />
      </div>`
