package br.com.casadocodigo.loja.controllers;

import javax.transaction.Transactional;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.casadocodigo.loja.dao.ProductDAO;
import br.com.casadocodigo.loja.model.BookType;
import br.com.casadocodigo.loja.model.Product;

@Controller
@Transactional
@RequestMapping("/products")
public class ProductController {

	@Autowired
	private ProductDAO productDao;
	
	//A ordem do parametro bindingResult importa!
	@RequestMapping(method = RequestMethod.POST)
	public ModelAndView save(@Valid Product product, BindingResult bindingResult, RedirectAttributes redirectAttributes) {
		if (bindingResult.hasErrors()){
			return form(product);
		}
		
		productDao.save(product);
		redirectAttributes.addFlashAttribute("success", "Produto cadastrado com sucesso");
		return new ModelAndView("redirect:/products");
	}

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("products/list");
		modelAndView.addObject("products", productDao.list());
		return modelAndView;
	}
	
	@RequestMapping("/form")
	public ModelAndView form(Product product) {
		ModelAndView modelAndView = new ModelAndView("products/form");
		modelAndView.addObject("types", BookType.values());
		return modelAndView;
	}
	
}
