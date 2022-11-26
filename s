
[1mFrom:[0m /home/ec2-user/environment/nagano_cake/app/controllers/public/orders_controller.rb:16 Public::OrdersController#confirm:

     [1;34m7[0m: [32mdef[0m [1;34mconfirm[0m
     [1;34m8[0m:   @order=[1;34;4mOrder[0m.new(order_params)
     [1;34m9[0m:   @orders=current_customer.cart_items
    [1;34m10[0m:   @customer=current_customer
    [1;34m11[0m:   @cart_items=current_customer.cart_items
    [1;34m12[0m:   @total_price=@cart_items.sum{|cart_item|cart_item.item.with_tax_price * cart_item.amount}
    [1;34m13[0m:   params[[33m:order[0m][[33m:payment_method[0m] = params[[33m:order[0m][[33m:payment_method[0m].to_i [1;34m##支払方法の情報[0m
    [1;34m14[0m:   [1;34m##分岐[0m
    [1;34m15[0m:   binding.pry
 => [1;34m16[0m:   [32mif[0m params[[33m:order[0m][[33m:address[0m] == [31m[1;31m"[0m[31m0[1;31m"[0m[31m[0m
    [1;34m17[0m:     @order.postal_code=current_customer.postal_code
    [1;34m18[0m:     @order.address=current_customer.address
    [1;34m19[0m:     @order.name=current_customer.last_name + current_customer.first_name
    [1;34m20[0m: 
    [1;34m21[0m:   [32melsif[0m params[[33m:order[0m][[33m:address[0m] == [31m[1;31m"[0m[31m1[1;31m"[0m[31m[0m
    [1;34m22[0m: 
    [1;34m23[0m:   [32melsif[0m params[[33m:order[0m][[33m:address[0m] == [31m[1;31m"[0m[31m2[1;31m"[0m[31m[0m
    [1;34m24[0m: 
    [1;34m25[0m:   [32melse[0m
    [1;34m26[0m: 
    [1;34m27[0m:     render [31m[1;31m'[0m[31mnew[1;31m'[0m[31m[0m
    [1;34m28[0m: 
    [1;34m29[0m:   [32mend[0m
    [1;34m30[0m: 
    [1;34m31[0m: [32mend[0m

