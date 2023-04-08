package com.sh.j3l.storeOrder.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.sh.j3l.cart.model.dto.Cart;
import com.sh.j3l.storeOrder.model.dto.StoreOrder;

@Mapper
public interface StoreOrderDao {

	int insertOrder(@Param("cart") Cart cart, @Param("pickupZone") String pickupZone);

	@Select("select * from store_order where id = #{id}")
	List<StoreOrder> selectAllMyOrderList(String id);

}
