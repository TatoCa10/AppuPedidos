/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vo;

/**
 *
 * @author Carlos Alberto
 */
public class PedidosVO {
    
    private String ID;
    private String Vendedor;
    private String Comprador;
    private String Productos;
    private String Comentario;
    private boolean checker;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getVendedor() {
        return Vendedor;
    }

    public void setVendedor(String Vendedor) {
        this.Vendedor = Vendedor;
    }

    public String getComprador() {
        return Comprador;
    }

    public void setComprador(String Comprador) {
        this.Comprador = Comprador;
    }

    public String getProductos() {
        return Productos;
    }

    public void setProductos(String Productos) {
        this.Productos = Productos;
    }

    public String getComentario() {
        return Comentario;
    }

    public void setComentario(String COmentario) {
        this.Comentario = COmentario;
    }

    public boolean getChecker() {
        return checker;
    }

    public void setChecker(boolean checker) {
        this.checker = checker;
    }
    
    
    
    
    
}
