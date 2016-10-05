package com.shoes.framework.base.service.daoimpl;



import com.shoes.framework.base.service.daoimpl.event.ServiceEventHandler;
import com.shoes.util.PageList;

import java.util.List;
import java.util.Map;

/**
 * BaseService 作为业务Service的基类，提供业务类事件处理器的容器。业务类事件处理器内可以注册0~n个事件监听器。
 */
public interface BaseService<T> {
	
	/**
	 * 获取业务Service的业务类事件处理器
	 * @return 业务类事件处理器
	 */
	ServiceEventHandler getEventHandler() ;
	
	void insert(T object);

	int update(T object);
	
	int update(Map<String, Object> param);

	int delete(Map<String, Object> param);

	int delete(Object id);

	T getById(Object id);

	int getCount(Map<String, Object> param);
	
	PageList<T> getList(Map<String, Object> params, int pageNo, int pageSize, boolean doCount);

	PageList<T> getList(Map<String, Object> params, int pageNo, int pageSize);

	void batchInsert(List<T> list);

}