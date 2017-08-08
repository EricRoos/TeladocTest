class @ProductSelector extends React.Component

  handleQuantityUpdate: (ev)->
    this.props.notify({id: this.props.product.id, quantity: ev.target.value})

  render: ->
    product = this.props.product
    disabled = product.stock_value == 0
    `<div className='product'>
      <label>{product.name} ({product.stock_value}) </label>
      <input type='hidden' name='productId' value={product.id} />
      <input type='number' name='quantity' disabled={disabled} onChange={this.handleQuantityUpdate.bind(this)} />
    </div>`
