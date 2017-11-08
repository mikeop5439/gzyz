package com.gzyz.bean.users.extend;

import java.util.List;

import com.gzyz.bean.users.User;
import com.gzyz.bean.users.cart;

public class UserCart extends User{
		private List<cart> cart;
		private int newpage;
		public List<cart> getCart() {
			return cart;
		}

		public void setCart(List<cart> cart) {
			this.cart = cart;
		}

		public int getNewpage() {
			return newpage;
		}

		public void setNewpage(int newpage) {
			this.newpage = newpage;
		}
		
		
		
}
