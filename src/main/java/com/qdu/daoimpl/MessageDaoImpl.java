package com.qdu.daoimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.qdu.dao.MessageDao;
import com.qdu.pojo.Message;

@Repository
public class MessageDaoImpl implements MessageDao{
	@Autowired 
	private SqlSessionFactory sessionFactory;

	@Override 
	public void insertMessage(Message message) {
		String statement = "com.qdu.mapping.MessageMapping.insertMessage";
		sessionFactory.openSession().insert(statement, message);
	}

	@Override
	public int selectMessageCount(String messageAccepter) {
		String statement = "com.qdu.mapping.MessageMapping.selectMessageCount";
		return sessionFactory.openSession().selectOne(statement, messageAccepter);
	}

	@Override
	public List<Message> selectUnreadMessage(String messageAccepter ,int startPos) {
		String statement = "com.qdu.mapping.MessageMapping.selectUnreadMessage";
		Map<String, Object> map = new HashMap<>();
		map.put("messageAccepter", messageAccepter);
		map.put("startPos", startPos);
		return sessionFactory.openSession().selectList(statement, map);
	}

	@Override
	public Message selectMessageById(int messageId) {
		String statement = "com.qdu.mapping.MessageMapping.selectMessageById";
		return sessionFactory.openSession().selectOne(statement, messageId);
	}

	@Override
	public void uodateMesageHaveread(int messageId) {
		String statement = "com.qdu.mapping.MessageMapping.uodateMesageHaveread";
		sessionFactory.openSession().update(statement, messageId);
	}

	@Override
	public int selectMessageTotalCount(String messageAccepter) {
		String statement = "com.qdu.mapping.MessageMapping.selectMessageTotalCount";
		return sessionFactory.openSession().selectOne(statement, messageAccepter);
	}

	

}
