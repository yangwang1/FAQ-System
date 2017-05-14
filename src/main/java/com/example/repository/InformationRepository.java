package com.example.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.entities.Information;

public interface InformationRepository extends JpaRepository<Information, Integer> {

}
