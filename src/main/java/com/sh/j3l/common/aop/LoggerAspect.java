package com.sh.j3l.common.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

/**
 * Aspect 클래스
 * - 한 쌍의 pointcut, advice를 관리
 * @author jangcccci
 *
 */
@Aspect
@Component
@Slf4j
public class LoggerAspect {

//	/**
//	 * Pointcut
//	 * - 조인포인트 선정룰
//	 * 
//	 * 표현식 execution(* com.sh.spring.todo..*(..))
//	 * - * 모든 리턴타입
//	 * - com.sh.spring.todo패키지 하위 모든 클래스의 모든 메소드
//	 * - (..) 모든 매개변수타입
//	 */
//	@Pointcut("execution(* com.sh.spring.todo..*(..))")
//	public void pointcut() {}
//	
//	/**
//	 * Advice
//	 * - 주업무로직에 부가적으로 수행할 로직
//	 * - 지정한 pointcut에 따라 특정 조인포인트에서 실행
//	 * - 실행조건에 따라 befor, around, after-returning, after, after-throwing 구분
//	 */
//	@Around("pointcut()")
//	public Object logger(ProceedingJoinPoint joinPoint) throws Throwable {
//		// joinPoint 정보 가져오기
//		Signature signature = joinPoint.getSignature();
//		String type = signature.getDeclaringTypeName();
//		String methodName = signature.getName();
//		
//		// before
//		log.debug("[before] {}.{}", type, methodName);
//		
//		Object obj = joinPoint.proceed();
//		// after
//		log.debug("[after] {}.{}", type, methodName);
//		
//		return obj;
//	}
}
