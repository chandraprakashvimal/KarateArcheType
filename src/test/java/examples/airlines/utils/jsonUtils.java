package examples.airlines.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.util.Map;
import java.util.stream.Collectors;

public class jsonUtils {
    public static String removeNullValues(Map<String , Object> jsonMap) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> json = jsonMap
                .entrySet()
                .stream()
                .filter(entry->entry.getValue()!=null && entry.getValue()!="")
                .collect(Collectors.toMap(entry->entry.getKey(), entry->entry.getValue()));
        return mapper.writeValueAsString(json);
    }

    public static String removeNullValues(String jsonMap) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        Map<String, Object> json = mapper.readValue(jsonMap, new TypeReference<Map<String, Object>>() {
                })
                .entrySet()
                .stream()
                .filter(entry->entry.getValue()!=null && entry.getValue()!="")
                .collect(Collectors.toMap(entry->entry.getKey(), entry->entry.getValue()));
        return mapper.writeValueAsString(json);
    }
}
