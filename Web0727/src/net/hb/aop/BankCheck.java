package net.hb.aop;

import java.io.*;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.After;

@Aspect
public class BankCheck {
	@Before("execution(public * net.hb.controller..*(..))")
	public void open(){
		System.out.println("Controller Procedure call open()");
	}//end

	@After("execution(public * net.hb.controller..*(..))")
	public void close(){
		System.out.println("Controller Procedure call close()\n");
	}//end
}
