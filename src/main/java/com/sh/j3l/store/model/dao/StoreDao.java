package com.sh.j3l.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.sh.j3l.store.model.dto.SnackCategory;
import com.sh.j3l.store.model.dto.Store;

@Mapper
public interface StoreDao {

	@Insert("insert into store values(#{name}, #{price}, #{originalFilename}, #{renamedFilename}, #{snackCategory})")
	int insertStore(Store store);

	List<Store> selectAllStoreList(Map<String, SnackCategory> snackCateMap);
}
