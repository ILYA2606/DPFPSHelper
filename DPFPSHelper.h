//
//  DPFPSHelper.h
//
//  Created by ILYA2606 on 21.06.13.
//  Copyright (c) 2013 Darkness Production. All rights reserved.
//

#import <Foundation/Foundation.h>

#define CACHE_FILE_NAME @"MethodsInfo.plist"

@interface DPFPSHelper : NSObject

/**
 * +(id)getFPSMethod:withTarget:
 *
 * Вызывает objective-c метод без параметров с информацией о FPS
 *
 * @return возвращенный объект вызванного метода
 * 
 * @param имя вызываемого метода
 *
 * @param объект, вызывающий метод
 */
 
+(id)getFPSMethod:(NSString*)methodString withTarget:(id)target;

/**
 * +(id)getFPSMethod:withTarget:withObject:
 *
 * Вызывает objective-c метод с одним параметром с информацией о FPS
 *
 * @return возвращенный объект вызванного метода
 *
 * @param имя вызываемого метода
 *
 * @param объект, вызывающий метод
 *
 * @param объект, передающийся в качестве параметра вызываемому методу
 */

+(id)getFPSMethod:(NSString*)methodString withTarget:(id)target withObject:object;

/**
 * +(id)getFPSMethod:withTarget:withObject:withObject:
 *
 * Вызывает objective-c метод с двумя параметрами с информацией о FPS
 *
 * @return возвращенный объект вызванного метода
 *
 * @param имя вызываемого метода
 *
 * @param объект, вызывающий метод
 *
 * @param первый объект, передающийся в качестве параметра вызываемому методу
 *
 * @param второй объект, передающийся в качестве параметра вызываемому методу
 */

+(id)getFPSMethod:(NSString*)methodString withTarget:(id)target withObject:object1 withObject:object2;

@end


@interface DPCacheHelper : NSObject

/**
 * +(void)clearCache
 *
 * Очищает кэш-файл
 */

+(void)clearCache;

/**
 * +(BOOL)saveArray:toCacheFile:
 *
 * Сохраняет массив в кэш-файл
 *
 * @return результат сохранения массива в кэш-файл
 *
 * @param массив для сохранения
 *
 * @param имя кэш-файла, в который необходимо сохранить массив (включая расширение)
 */

+(BOOL)saveArray:(NSArray*)object toCacheFile:(NSString*)fileName;

/**
 * +(NSArray*)arrayFromCacheFile:
 *
 * Возвращает массив из кэш-файла
 *
 * @return массив из кэш-файла
 *
 * @param имя кэш-файла (включая расширение)
 */

+(NSArray*)arrayFromCacheFile:(NSString*)fileName;

/**
 * +(NSString *)applicationCacheDirectory
 *
 * Возвращает абсолютный путь к директории кэша приложения
 *
 * @return абсолютный путь к директории кэша приложения
 */
+(NSString *)applicationCacheDirectory;

@end
