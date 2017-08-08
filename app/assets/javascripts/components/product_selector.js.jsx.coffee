class @ProductSelector extends React.Component

  handleQuantityUpdate: (ev)->
    this.props.notify({id: this.props.product.id, quantity: ev.target.value})

  render: ->
    product = this.props.product
    `<div className='product'>
      <label>{product.name}</label>
      <input type='hidden' name='productId' value={product.id} />
      <input type='number' name='quantity' onChange={this.handleQuantityUpdate.bind(this)} />
    </div>`
