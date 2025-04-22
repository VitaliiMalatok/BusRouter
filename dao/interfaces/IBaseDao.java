package dao.interfaces;


public interface IBaseDAO<T> {
    T getEntityById(int id);

    void createEntity(T entity);

    void updateEntity(T entity);

    void removeEntity(T entity);

    void List<T> getAll();
}
