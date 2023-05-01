package com.ringdingdong.ridingthewind.aspect;

import java.util.Arrays;

import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Component
@Aspect
@Slf4j
public class LoggingAspect {

	@Around(value = "execution(* com.ringdingdong.ridingthewind..*(..))")
	public Object loggingExecutionTime(ProceedingJoinPoint joinPoint) throws Throwable {
		log.debug("Call Method : {}, Received Parameter : {}", joinPoint.getSignature().toShortString(), Arrays.toString(joinPoint.getArgs()));

		StopWatch stopWatch = new StopWatch();
		stopWatch.start();
		Object proceed = joinPoint.proceed();
		stopWatch.stop();

		log.debug("Call Method : {}, ExecutionTime : {} ms", joinPoint.getSignature().toShortString(), stopWatch.getTotalTimeMillis());
		return proceed;
	}

	@AfterThrowing(value = "execution(* com.ringdingdong.ridingthewind..*(..)))", throwing = "exception")
	public void afterThrowingMethod(JoinPoint joinPoint, Exception exception) {
		log.error("Call Method : {}, Exception : {}", joinPoint.getSignature().toShortString(), exception);
	}

}