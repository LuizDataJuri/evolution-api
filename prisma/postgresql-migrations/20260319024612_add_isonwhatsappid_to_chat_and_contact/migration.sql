-- AlterTable
ALTER TABLE "Chat" ADD COLUMN     "isOnWhatsappId" TEXT;

-- AlterTable
ALTER TABLE "Contact" ADD COLUMN     "isOnWhatsappId" TEXT;

-- CreateIndex
CREATE INDEX "Chat_isOnWhatsappId_idx" ON "Chat"("isOnWhatsappId");

-- CreateIndex
CREATE INDEX "Contact_isOnWhatsappId_idx" ON "Contact"("isOnWhatsappId");

-- AddForeignKey
ALTER TABLE "Chat" ADD CONSTRAINT "Chat_isOnWhatsappId_fkey" FOREIGN KEY ("isOnWhatsappId") REFERENCES "IsOnWhatsapp"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contact" ADD CONSTRAINT "Contact_isOnWhatsappId_fkey" FOREIGN KEY ("isOnWhatsappId") REFERENCES "IsOnWhatsapp"("id") ON DELETE CASCADE ON UPDATE CASCADE;
