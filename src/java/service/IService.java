/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import java.util.ArrayList;

/**
 *
 * @author hoatd
 */
public interface IService <T> {
    public ArrayList<T> GetAll();
    public T GetDetail(int id);
    public boolean Add(T model);
    public boolean Update(int id, T model);
    public boolean Delete(int id);
}
