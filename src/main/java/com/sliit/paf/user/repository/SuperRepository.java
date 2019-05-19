package com.sliit.paf.user.repository;

import org.hibernate.Session;

public interface SuperRepository {

    Session getSession();

}
