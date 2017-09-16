package com.smarthouse.model.base;

import java.util.List;
import java.util.Map;

public interface BaseCRUDService<E extends BaseEntity> {

    public void create(E entity);

    public void update(E entity);

    public void delete(Long id) ;

    public E readById(Long id);

    public List<E> readByCriteria(Map<Long, Object> criteria);

}
