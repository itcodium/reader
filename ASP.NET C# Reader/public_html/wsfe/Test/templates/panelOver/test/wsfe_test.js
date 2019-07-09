Factura = Backbone.Model.extend({
IdFactura:"",
IdPuntoVenta:"",
TipoComprobanteCodi: "",
PrestaServicio:"",
FacturaFechaEmision:"",
FacturaNroComprobante:"",
CaeFechaVto:"",
Cae:"",
EmisorNombreFantasia:"",
EmisorRazonSocial:"",
EmisorDomicilio:"",
EmisorCondicionIva:"",
EmisorCuit:"",
EmisorIngresosBrutos:"",
EmisorFechaInicio:"",
EmpresaLeyenda:"",
FacturaTipo:"",
FacturaCodigo:"",
ReceptorNroDocumento:"",
ReceptorTipoDocumento:"",
ReceptorDescripcionDocumento:"",
ReceptorCondicionIva:"",
ReceptorCondicionVenta:"",
ReceptorRazonSocial:"",
ReceptorDomicilioComercial:"",
ReceptorRemitoNro:"",
FechaDesde:"",
FechaHasta:"",
FechaVencimientoPago: ""
});


FacturaDetalle = Backbone.Model.extend({
 IdFacturaDatosOperacion:"",
IdFactura:"",
Codigo:"",
ProductoServicio:"",
Cantidad:"",
UnidadMedida:"",
PrecioUnidad:"",
Bonificacion:"",
BonificacionSubTotal:"",
ImporteBonificado:"",
AlicuotaIva:"",
ImporteIva:"",
Subtotal:""
});


FacturaOtrosAtributos  = Backbone.Model.extend({
    AtributosItems:"",
	Detalle:"",
	BaseImponible:"",
	Alicuota:"",
	Importe:""
});


FacturaOtrosAtributosList = Backbone.Collection.extend({
    model: FacturaOtrosAtributos
});



FacturaResumenTotal= Backbone.Model.extend({
    Importe: "",
    Descripcion: "",
    Posicion: ""
});

FacturaResumenTotalList = Backbone.Collection.extend({
    model: FacturaResumenTotal
});




FacturaList = Backbone.Collection.extend({
    model: Factura
});

FacturaDetalleList = Backbone.Collection.extend({
    model: FacturaDetalle
});


function convertToJSONDate(strDate) {
    var dt = new Date(strDate);
    var newDate = new Date(Date.UTC(dt.getFullYear(), dt.getMonth(), dt.getDate(), dt.getHours(), dt.getMinutes(), dt.getSeconds(), dt.getMilliseconds()));
    return '/Date(' + newDate.getTime() + ')/';
}


var wsfe = function () {
    var content = "";
    var cAjax = new AjaxCaller();
    var pnlTablePhoto;
    this.content = function (p) {
        content = p;
        cAjax.content(p);
    }

    this.ajaxSpin = function (p) {
        cAjax.spin(p);
    }
    this.panel = function (p) {
        cAjax.panel(p);
    }


    this.Login = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_login);
    }

    this.CondicionIvaGetAll = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_CondicionIvaGetAll);
    }

    this.TipoComprobantesGetAll = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_TipoComprobantesGetAll);
    }

    this.ConceptosGetAll = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_ConceptosGetAll);
    }

    this.AlicuotaIvaGetAll = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_AlicuotaIvaGetAll);
    }
    this.TipoDocumentoGetAll = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_TipoDocumentoGetAll);
    }

    this.ProvinciaGetAll = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_ProvinciaGetAll);
    }

    this.UnidadMedidaGetAll = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_UnidadMedidaGetAll);
    }

    this.CondicionVentaGetAll = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_CondicionVentaGetAll);
    }

    this.EmpresaGetAll = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_EmpresaGetAll);
    }

    this.EmpresaPuntoVenta = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_EmpresaPuntoVenta);
    }

    this.FacturaSave = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_FacturaSave);
    }


    this.AtributosItemsGetAllByIdEmpresa = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_AtributosItemsGetAllByIdEmpresa);
    }

    this.DatosOperacionResumenTotal = function (purl, pdata) {
        cAjax.AjaxCall(purl, pdata, this.callback_DatosOperacionResumenTotal);
    }




    this.callback_login = function (data) {
        if (data[0].result == 1) {
            $(content).empty().append("<b>IdUsuario: </b>" + data[1].data.IdUsuario);
        } else {
            alert(data[0].message)
        }
    }

    this.callback_CondicionIvaGetAll = function (data) {
        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                $(content).append(item.DenomAbrev + " - " + item.Descripcion + " - " + item.IdCondicionIva + " - " + item.Porcentaje + "<br>");
            });
        } else {
            alert(data[0].message)
        }
    }

    this.callback_TipoComprobantesGetAll = function (data) {
        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                $(content).append(item.Codigo + " - " + item.Descripcion + " - " + item.DenomAbrev + " - " + item.tipo + "<br>");
            });
        } else {
            alert(data[0].message)
        }
    }
    this.callback_ConceptosGetAll = function (data) {
        console.log("callback_ConceptosGetAll", data);

        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                $(content).append(item.Descripcion + " - " + item.PrestaServicios + "<br>");

            });
        } else {
            alert(data[0].message)
        }
    }

    this.callback_AlicuotaIvaGetAll = function (data) {
        console.log("callback_AlicuotaIvaGetAll", data);

        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                $(content).append(item.Descripcion + " - " + item.IdAlicuotaIva + " - " + item.Valor + "<br>");
            });
        } else {
            alert(data[0].message)
        }
    }

    this.callback_TipoDocumentoGetAll = function (data) {
        console.log("callback_TipoDocumentoGetAll", data);
        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                $(content).append(item.IdTipoDocumento + " - " + item.CodTipoDocumento + " - " + item.Descripcion + "<br>");
            });
        } else {
            alert(data[0].message)
        }
    }


    this.callback_ProvinciaGetAll = function (data) {
        console.log("callback_ProvinciaGetAll", data);
        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                $(content).append(item.IdCodProvincia + " - " + item.Codigo + " - " + item.Descripcion + "<br>");
            });
        } else {
            alert(data[0].message)
        }
    }

    this.callback_UnidadMedidaGetAll = function (data) {
        console.log("callback_UnidadMedidaGetAll", data);
        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                $(content).append(item.IdUnidadMedida + " - " + item.DenomAbrev + " - " + item.Descripcion + "<br>");
            });
        } else {
            alert(data[0].message)
        }
    }

    this.callback_CondicionVentaGetAll = function (data) {
        console.log("callback_CondicionVentaGetAll", data);
        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                $(content).append(item.IdCondicionVenta + " - " + item.Cuotas + " - " + item.DenomAbrev + " - " + item.Descripcion + "<br>");
            });
        } else {
            alert(data[0].message)
        }
    }


    this.callback_EmpresaGetAll = function (data) {
        console.log("callback_EmpresaGetAll", data);
        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                $(content).append(
                        item.IdEmpresa + " -<br> " +
                        item.IdCondicionIva + " - <br>" +
                        item.RazonSocial + " - <br>" +
                        item.NombreFantasia + " - <br>" +
                        item.FechaInicio + " - <br>" +
                        item.Cuit + " - <br>" +
                        item.IngresosBrutos + " - <br>" +
                        item.Leyenda);
            });
        } else {
            alert(data[0].message)
        }
    }

    this.callback_EmpresaPuntoVenta = function (data) {

        console.log("callback_EmpresaPuntoVenta", data);
        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                $(content).append(item.IdEmpresa + " - " + item.IdPuntoVenta + " - " + item.DenomAbrev);
            });
        } else {
            alert(data[0].message)
        }
    }

    this.callback_FacturaSave = function (data) {

        console.log("callback_FacturaSave", data);
        if (data[0].result == 1) {
            $(content).append("Se guardo la factura: " + data[0].message);
        } else {
            alert(data[0].message)
        }
    }




    this.callback_DatosOperacionResumenTotal = function (data) {
     

        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                
                vFacturaResumenTotalList.add(new FacturaResumenTotal({ 
                    Importe: item.Importe,
                    Descripcion: item.Descripcion,
                    Position: item.Posicion
                    })
                );

                $(content).append(item.Position + " - " + item.CssName + " - " + item.Descripcion + " - " + item.Importe + "<br>");
            });
        } else {
            alert(data[0].message)
        }

        var jsonFacturaResumenTotalList = vFacturaResumenTotalList.toJSON();
        var strJsonFacturaResumenTotalList = JSON.stringify(jsonFacturaResumenTotalList);

        
        console.log("!!!ResumenTotal!!!", data[1].data, vFacturaResumenTotalList.models, vFacturaResumenTotalList.toJSON());
        console.log("!!!****************!!!", strJsonFacturaResumenTotalList);
      
    }


    this.callback_AtributosItemsGetAllByIdEmpresa = function (data) {
        
        if (data[0].result == 1) {
            $.each(data[1].data, function (i, item) {
                var fac = new FacturaOtrosAtributos({ atributosItems: item.descripcion, detalle: item.detalle,
                                                       baseImponible: item.BaseImponible,alicuota:item.Alicuota,importe: item.Importe });
                vFacturaOtrosAtributosList.add(fac);

                $(content).append(item.Descripcion + " - " + item.detalle + " - " + item.BaseImponible + " - " + item.Alicuota + " - " + item.Importe + "<br>");
            });
        } else {
            alert(data[0].message)
        }
        console.log("callback_AtributosItemsGetAllByIdEmpresa", data, vFacturaOtrosAtributosList);
    }





};



