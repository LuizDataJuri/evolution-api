UPDATE "Chat" c
SET "isOnWhatsappId" = sub."id" FROM (SELECT DISTINCT ON (c."id") c."id" AS chat_id, iow."id"
            FROM "Chat" c
                     JOIN "IsOnWhatsapp" iow ON iow."remoteJid" != '0@s.whatsapp.net' AND
                                                iow."jidOptions" LIKE CONCAT('%', c."remoteJid", '%')
           WHERE c."remoteJid" != '0@s.whatsapp.net'
             AND c."isOnWhatsappId" IS NULL) sub
WHERE c."id" = sub.chat_id;

UPDATE "Contact" c
SET "isOnWhatsappId" = sub."id" FROM (SELECT DISTINCT ON (c."id") c."id" AS contact_id, iow."id"
            FROM "Contact" c
                     JOIN "IsOnWhatsapp" iow ON iow."remoteJid" != '0@s.whatsapp.net' AND
                                                iow."jidOptions" LIKE CONCAT('%', c."remoteJid", '%')
           WHERE c."remoteJid" != '0@s.whatsapp.net'
             AND c."isOnWhatsappId" IS NULL) sub
WHERE c."id" = sub.contact_id;