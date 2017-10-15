package com.smarthouse.controller.relatorio;

import com.smarthouse.model.ConnectionManager;
import com.smarthouse.model.entity.Usuario;
import com.smarthouse.model.service.UsuarioService;
import java.io.InputStream;
import java.sql.Connection;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/relatoriodispositivo")
public class DispositivoRelatorio {

    @RequestMapping(method = RequestMethod.GET)
    public void streamPDF(HttpServletResponse response, HttpSession session) throws Exception {
        //Fonte dados
        Connection conn = ConnectionManager.getInstance().getConnection();
        //Parametros
        Map parameters = new HashMap();
        UsuarioService service = new UsuarioService();
        Usuario usuario = new Usuario();
        usuario = (Usuario) session.getAttribute("usuarioLogado");
        parameters.put("USER", usuario.getNome());
        //Criando o relatório.
        InputStream report = DispositivoRelatorio.class.getResourceAsStream("/com/smarthouse/controller/relatorio/relatorio_dispositivo.jasper");
        JasperPrint print = JasperFillManager.fillReport(report, parameters, conn);
        //Exportando em PDF
        byte[] pdf = JasperExportManager.exportReportToPdf(print);

        response.setContentType("application/pdf");
        response.getOutputStream().write(pdf);
        response.flushBuffer();
    }
}
