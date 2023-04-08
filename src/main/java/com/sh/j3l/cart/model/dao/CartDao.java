package com.sh.j3l.cart.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.sh.j3l.cart.model.dto.Cart;

import lombok.Delegate;

@Mapper
public interface CartDao {

	@Select("select c.*, s.renamed_filename from cart c left join store s on c.store_name = s.name where id = #{id}")
	List<Cart> selectAllMyCart(String id);

	@Insert("insert into cart values(seq_cart_no.nextval, #{id}, #{name}, #{price}, default)")
	int insertCart(@Param("name") String name, @Param("id") String id, @Param("price") int price);

	@Update("update cart set store_count = store_count + 1 where store_name = #{name} and id = #{id}")
	int storeCountUp(@Param("name") String name, @Param("id") String id);

	@Delete("delete from cart where id = #{id}")
	int deleteMyCart(String id);

	@Delete("delete from cart where no = #{no}")
	int deleteMyOneCart(@Param("no") int no);

	@Update("update cart set store_count = #{count} where no = #{no}")
	int updateCart(@Param("no") int no, @Param("count") int count);

	@Update("update cart set pickup_zone = #{pickupZone} where id = #{id}")
	int updateCartPickupZone(@Param("id") String id, @Param("pickupZone") String pickupZone);

}
