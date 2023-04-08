---@meta _

---Wraps MAME's `util::notifier_subscription` class, which mnages a
---subscription to a broadcast notification.
---@class notifier_subscription
---@field is_active boolean A boolean indicating whether the subscription is active. A subscription becomes inactive after explicitly unsubscribing or if the underlying notifier is destroyed.
local notifier_subscription = {}

---Unsubscribes from notifications. The subscription will become inactive and
---no future notifications will be received.
function notifier_subscription:unsubscribe() end

return notifier_subscription