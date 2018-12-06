# NSDictionary

## 说明
- 对NSDictionary进行了扩展

## NSDictionary+Category

```Object-C
/**
 *  字段转成json的字符串
 *
 *  @return json 字符串
 */
- (NSString *)wya_TransToJSONString;
```

## NSDictionary+Safe

```Object-C
/**
 通过key获取Value值

 @param key key
 @return value
 */
- (id)wya_safeObjectForKey:(NSString *)key;

/**
 key-value方式设置dict

 @param object value
 @param key key
 */
- (void)wya_safeSetValue:(id)object forKey:(id)key;

- (id)wya_objectForKeyCustom:(id)aKey;

/**
 value获取key

 @param value value
 @return key
 */
- (id)wya_safeKeyForValue:(id)value;
```

## NSMutableDictionary+Safe

```Object-C
- (void)wya_safeSetObject:(id)aObj forKey:(id<NSCopying>)aKey;

- (id)wya_safeObjectForKey:(id<NSCopying>)aKey;
```

