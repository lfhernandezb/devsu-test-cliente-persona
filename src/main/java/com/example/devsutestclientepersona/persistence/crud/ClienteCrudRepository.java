package com.example.devsutestclientepersona.persistence.crud;

import org.springframework.data.repository.CrudRepository;
import com.example.devsutestclientepersona.persistence.entity.Cliente;

public interface ClienteCrudRepository extends CrudRepository<Cliente, Long> {
}
