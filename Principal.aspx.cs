using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Principal : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack)
        {
            Label1.Text = "";
        }
    }

    protected void btn_lanzar_Click(object sender, EventArgs e)
    {
        //n: numero total de paquetes habidos
        //k: numero de paquetes a enviar
        //lista: cadena de valores(peso) de los paquetes habidos           

        int n = int.Parse(tb_n.Text);
        int k = int.Parse(tb_k.Text);
        string letLista = tb_lista.Text.ToString();
        int[] numLista = sacarNumeros(letLista);

        //comparacmos si la pagina esta validada y si la cantidad de paquetes y la cadena tiene el mismo tamaño
        if (Page.IsValid && n == letLista.Count())
        {
            //he ahi el problema
            tb_peso.Text = heAhiElProblema(numLista, k);
        } else if (n != letLista.Count())
        {
            Label1.Text = "No coinciden los campos (1) y (3)";
        }
    }    
    
    public string heAhiElProblema(int[] numeros, int k)
    {
        int sumPaq = 0;
        int sumMin = 5000;//valor inalcanzable

        for (int i = 0; i < numeros.Count() - 1; i++)
        {
            int contadorK = 1;
            sumPaq = numeros[i];
            int retroi = i;
            for (int j = i + 1; j < numeros.Count(); j++)
            {
                if (contadorK < k)//evaluamos el numero de paquetes a enviar para sumar el peso minimo
                {
                    int mayor = Math.Max(numeros[i], numeros[j]);
                    int menor = Math.Min(numeros[i], numeros[j]);
                    int posiciones = mayor - menor;
                    if (posiciones > 2)
                    {
                        i = j;
                        sumPaq = sumPaq + numeros[j];
                        contadorK++;
                    }                    
                }                                                
            }
            i = retroi;
            if (sumPaq < sumMin && contadorK == k)//comprobamos contadorK y cambiamos valores para sacar el peso minimo
            {
                sumMin = sumPaq;
            }
            else if (sumMin == 5000)
            {
                sumMin = -1;
            }                  
        }        

        return sumMin.ToString();   
    }

    public int[] sacarNumeros(string lista)
    {      
        char[] paquetes = { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z' };
                   
        int[] numeros = new int[lista.Count()];        

        for (int i = 0; i < lista.Count(); i++)
        {            
            for (int j = 0; j < paquetes.Count(); j++)
            {                
                char charActual = char.Parse(lista.Substring(i, 1));                
                int charPosi = j;
                if (paquetes[j].Equals(charActual))
                {
                    numeros[i] = charPosi + 1 ;                    
                }
            }
        }
                
        return numeros;
    }
    //validaciones CustomValidator
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (int.Parse(args.Value) < int.Parse(tb_k.Text))
        {
            Label1.Text = "1 <= k <= n <= 50";
        }
    }

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (int.Parse(args.Value) > int.Parse(tb_k.Text))
        {
            Label1.Text = "1 <= k <= n <= 50";
        }
    }
}