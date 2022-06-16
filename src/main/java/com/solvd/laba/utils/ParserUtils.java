package com.solvd.laba.utils;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import com.fasterxml.jackson.databind.*;
import com.fasterxml.jackson.databind.ser.std.StdSerializer;
import com.solvd.laba.dao.model.BuiltRoute;
import jakarta.xml.bind.JAXBContext;
import jakarta.xml.bind.JAXBException;
import jakarta.xml.bind.Marshaller;
import jakarta.xml.bind.annotation.adapters.XmlAdapter;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ParserUtils {

    private static final Logger LOGGER = LogManager.getLogger(ParserUtils.class);

    private static final ObjectMapper MAPPER = new ObjectMapper();

    public static void writeXml(BuiltRoute builtRoute, File file) {
        try {
            JAXBContext jaxbContext = JAXBContext.newInstance(BuiltRoute.class);
            Marshaller marshaller = jaxbContext.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            marshaller.marshal(builtRoute, file);
        } catch (JAXBException e) {
            LOGGER.error("Unable to write xml " + e.getMessage(), e);
        }
    }

    public static void writeJson(BuiltRoute builtRoute, File file) {
        try {
            ObjectWriter writer = MAPPER.writer(new DefaultPrettyPrinter());
            writer.writeValue(file, builtRoute);
        } catch (IOException e) {
            LOGGER.error("Unable to write json " + e.getMessage(), e);
        }
    }

    public static class LocalDateTimeSerializer extends StdSerializer<LocalDateTime> {

        protected LocalDateTimeSerializer() {
            super(LocalDateTime.class);
        }

        @Override
        public void serialize(LocalDateTime localDateTime, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException {
            jsonGenerator.writeString(localDateTime.format(DateTimeFormatter.ISO_LOCAL_DATE_TIME));
        }
    }

    public static class LocalDateAdapter extends XmlAdapter<String, LocalDateTime> {

        @Override
        public LocalDateTime unmarshal(String v) {
            return LocalDateTime.parse(v);
        }

        @Override
        public String marshal(LocalDateTime v) {
            return v.toString();
        }
    }
}
