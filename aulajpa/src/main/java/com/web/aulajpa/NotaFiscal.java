package com.web.aulajpa;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Data;


@Entity
@Table(name = "notafiscal")
@Data
@Builder

public class NotaFiscal {
	
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "numero", nullable = true)
	private Integer numero;
	
	@OneToMany
	private List<Item_nf> item_nf;
	
	@Column(name = "descricao")
	private String descricao;
	
	
	
	

}
