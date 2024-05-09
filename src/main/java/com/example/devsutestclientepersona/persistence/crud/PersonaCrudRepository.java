package com.example.devsutestclientepersona.persistence.crud;

import org.springframework.data.repository.CrudRepository;
import com.example.devsutestclientepersona.persistence.entity.Persona;

public interface PersonaCrudRepository extends CrudRepository<Persona, Long> {
}
